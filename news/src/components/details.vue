<template>
  <div id="details">
    <!-- 头 -->
    <div id="head">
      <i @click="prev" class="el-icon-back prev"></i>
      <span class="name">新闻详情</span>
    </div>
    <!-- 详情dom -->
    <div class="wrapper">
      <p class="newstitle">{{detailData.newstitle}}</p>
      <p class="fi">
        <span class="newstime">{{detailData.newstime}}</span>
        <span class="newstype">
          <i>类型&nbsp;</i>
          {{detailData.type_name}}
        </span>
        <span class="collect"><i @click="goCollection" :class="off"></i></span>
        <div style="clear:both"></div>
      </p>
      <img class="newsimg" :src="detailData.img_src" alt="">
      <p class="newscontent">{{detailData.content}}</p>
      <li class="pinglun">
        <textarea v-model="comment" class="say"  cols="40" rows="3" placeholder="输入评论"></textarea>
        <el-button @click="goComment" class="suresay" type="primary">确定</el-button>
        <div style="clear:both"></div>
      </li>
      <li class="other">
        <div class="hot">热门评论</div>
        <p :style="nocomment">暂无评论</p>
        <p v-for="item in commentData">{{item.content}}</p>
      </li>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import {Toast} from 'mint-ui'
  export default{
    data(){
      return{
        detailData:[],
        off:'el-icon-star-off',
        collectionType:'',
        findUrl:'http://112.74.63.14/NewsApp/php/collection_find.php',
        cancelFindUrl:'http://112.74.63.14/NewsApp/php/cancel_find.php',
        ifFindUrl:'http://112.74.63.14/NewsApp/php/find_status.php',
        commentURL:'http://112.74.63.14/NewsApp/php/comment.php',
        getcommentData:'http://112.74.63.14/NewsApp/php/get_comment_data.php',
        collectionStatus:0,
        comment:'',
        commentData:[],
        nocomment:'display:block'
      }
    },
    methods:{
      // 返回
      prev:function(){
        history.back()
      },
      // 点击收藏
      goCollection(){
        // 在session中拿手机号
        const username = sessionStorage.getItem('username')
        // 判断是否登录
        if (username==''||username==null||username==undefined) {
          Toast({
            message: '请先登录',
            position: 'middle',
            duration:2000
          });
        }
        else{
          // 判断是否收藏
          // 拿user_id
          const user_id = JSON.parse(sessionStorage.loginUser).data.user_id
          // 如果是0是没收藏，1就是已经收藏
          if (this.collectionStatus==0) {
            // 判断收藏的类别-三种类别，find,fire,recommend,find可收藏、可评论
            if (this.collectionType=='fire') {
              Toast({
                message: '不可收藏',
                position: 'middle',
                duration:1000
              });
            }
            else if (this.collectionType=='recommend') {
              Toast({
                message: '不可收藏',
                position: 'middle',
                duration:1000
              });
            }
            else if (this.collectionType=='find') {
              var formdata = new FormData()
              formdata.append('user_id',user_id)
              formdata.append('find_id',this.detailData.newslist_id)
              axios({
                method:'POST',
                url:this.findUrl,
                data:formdata,
                config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
              })
              .then((res) =>{
                if (res.data.status==1) {
                  // 状态变成实心
                  this.off = 'el-icon-star-on'
                  Toast({
                    message: '收藏成功',
                    position: 'middle',
                    duration:1000
                  });
                  // 收藏状态变成1，已经收藏
                  this.collectionStatus=1
                }
                else if(res.data.status==0) {
                  Toast({
                    message: '收藏失败',
                    position: 'middle',
                    duration:1000
                  });
                }
              })
              .catch((res) =>{
                Toast({
                  message: '收藏失败',
                  position: 'middle',
                  duration:1000
                });
              })
            }
          }
          else{
            if (this.collectionType=='find') {
              var formdata = new FormData()
              formdata.append('user_id',user_id)
              formdata.append('find_id',this.detailData.newslist_id)
              axios({
                method:'POST',
                url:this.cancelFindUrl,
                data:formdata,
                config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
              })
              .then((res) =>{
                if (res.data.status==1) {
                  this.off = 'el-icon-star-off'
                  Toast({
                    message: '已取消收藏',
                    position: 'middle',
                    duration:1000
                  });
                  this.collectionStatus=0
                }
                else if(res.data.status==0) {
                  Toast({
                    message: '取消失败',
                    position: 'middle',
                    duration:1000
                  });
                }
              })
              .catch((res) =>{
                Toast({
                  message: '取消失败',
                  position: 'middle',
                  duration:1000
                });
              })
            }

          }
        }
      },
      // 加载时候判断是否收藏过，yes = 实心收藏标志
      collectionStatusIf(){
        const username = sessionStorage.getItem('username')
        const user_id = JSON.parse(sessionStorage.loginUser).data.user_id
        if (this.collectionType=='find') {
          var formdata = new FormData()
          formdata.append('user_id',user_id)
          formdata.append('find_id',this.detailData.newslist_id)
          axios({
            method:'POST',
            url:this.ifFindUrl,
            data:formdata,
            config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
          })
          .then((res) =>{
            // 判断收藏的状态
            // console.log(res)
            if (res.data.length==1) {
              this.off='el-icon-star-on'
              this.collectionStatus = 1
            }
            else if (res.data.status==0){
              this.off='el-icon-star-off'
              this.collectionStatus = 0
            }          
          })
          .catch((res) =>{
            Toast({
              message: '未知错误',
              position: 'middle',
              duration:1000
            });
          })
        }
      },
      // 评论
      goComment(){
        // 获取session用户名，手机号数据
        const username = sessionStorage.getItem('username')
        // 判断登录状态
        if (username==''||username==null||username==undefined) {
          Toast({
            message: '请先登录',
            position: 'middle',
            duration:1000
          });
        }
        else{
          // 如果已经登录，判断新闻的大类型（fire/recommend/find三种）只有find可以评论
          if (this.collectionType=='fire') {
            Toast({
              message: '不可评论',
              position: 'middle',
              duration:1000
            });
          }
          else if (this.collectionType=='recommend') {
            Toast({
              message: '不可评论',
              position: 'middle',
              duration:1000
            });
          }
          else if (this.collectionType=='find') {
            // 判断没输入评论内容
            if (this.comment=='') {
              Toast({
                message: '请输入内容',
                position: 'middle',
                duration:1000
              })
            }
            else{
              // 获取登录、或者注册时候存到session里面的user_id
              const  user_id = JSON.parse(sessionStorage.getItem('loginUser')).data.user_id
              // console.log(user_id)
              // 向后端传递，newslist_id、user_id、comment(评论内容)
              var formdata = new FormData()
              formdata.append('newslist_id',this.detailData.newslist_id)
              formdata.append('user_id',user_id)
              formdata.append('comment',this.comment)
              // ajax
              axios({
                method:'POST',
                url:this.commentURL,
                data:formdata,
                config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
              })
              .then((res) =>{
                // console.log(res.data)
                // 根据后台返回的状态，来判断评论的状态
                if (res.data.status==1) {
                  Toast({
                    message: '评论成功',
                    position: 'middle',
                    duration:1000
                  })
                  // 当评论成功的时候，输入框变成空的
                  this.comment = ''
                  //并且同步更新一下数据，让其实时显示评论内容
                  this.getCommentData()
                }
                else if(res.data.status==2){
                  // 这大部分错误是数据库，那面的错误
                  Toast({
                    message: '评论失败',
                    position: 'middle',
                    duration:1000
                  })
                }
              })
              // 其他错误，例如网络错误
              .catch((error) =>{
                Toast({
                  message: '服务器错误',
                  position: 'middle',
                  duration:1000
                })
                console.log(error)
              })
            }
          }
        }
        
      },
      // 获取评论数据
      getCommentData(){
        // 判断传递过来的类型
        if (this.collectionType=='find') {
          // console.log(this.detailData.newslist_id)
          // 获取newslist_id向后台传递
          var formdata = new FormData()
          formdata.append('newslist_id',this.detailData.newslist_id)
          // axios ==ajax
          axios({
            method:'POST',
            url:this.getcommentData,
            data:formdata,
            config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
          })
          .then((res) =>{
            // 根据后台返回来的值判断时候有评论数据
            if (res.data.status==0) {
              console.log('无评论')
            }
            else{
              // 有评论就把评论数组，传递给commentData
              this.commentData = res.data
              // 让暂无评论消失
              this.nocomment = 'display:none'
            }
            // console.log(this.commentData)
          })
          // 接口、或者网络出现错误才执行这段代码
          .catch((error) =>{
            console.log(error)
          })
        }
      }
    },
    // 组件创建成功的时候，属性已经绑定，但是DOM结构还未生成
    created:function(){
      
      // 页面之间传递过来的数据
      this.detailData = this.$route.params.detailData
      // 传递过来的收藏的类型，find
      this.collectionType = this.$route.params.collectionType
      // 获取session中的手机号（用户名）
      const username = sessionStorage.getItem('username')
      // 获取评论数据
      this.getCommentData()
      // 判断登录状态 
      if (username==''||username==null||username==undefined) {

      }
      else{
        // 如果已经登录，判断收藏的五角星状态
        this.collectionStatusIf()
      }
    },

  }
</script>

<style scoped>
/*样式*/
  #details{
    height: 34rem;
    overflow: auto;
  }
  #head{
    background:#2992d9;
    z-index:999;
    padding:.4rem 0;
    font-size:1rem;
    font-weight:bold;
    letter-spacing:.12rem;
    color:#fff;
    position:relative;
    top:0rem;
  }
  .prev{
    font-weight:bold;
    position:absolute;
    left:1rem;
    top:.2rem;
    padding:.4rem 1rem;
  }
  .name{
    font-size:.9rem;
  }
  .wrapper{
    /*background: #000;*/
    padding: 0 .8rem;
    overflow: hidden;
  }
  .newstitle{
    margin-top: 1rem;
    text-align: left;
    color: #000;
    font-size: 1.8rem;
  }
  .fi{
    margin-top: .6rem;
  }
  .newstime{
    float: left;
  }
  .newstype{
    float: left;
    margin-left: 2rem;
    color: red;
  }
  .newstype i:first-child{
    color: #000;
  }
  .newsimg{
    width: 100%;
    height:auto;
    margin: 0 auto;
    margin-top: 1rem;
  }
  .newscontent{
    margin-top: 1rem;
    line-height: 1.8rem;
    text-align: left;
  }
  .pinglun{
    margin-top: 1rem;
    padding: 0.2rem .6rem;
  }
  .say{
    width: 80%;
    float: left;
    padding:.2rem .5rem;
  }
  .suresay{
    width: 20%;
    float: right;
    margin-top: .6rem;
  }
  .other{
    text-align: left;
  }
  .other p{
    margin-top: 1rem;
    margin-left: 1rem;
    color: #6f6e6e;
  }
  .hot{
    color:#dc1111;
    margin-left: 1rem;
    margin-top: 1rem;
    font-size: .9rem;
  }
  .collect{
    float: right;
    margin-right: 2rem;
  }
  .collect i{
    font-size: 1.2rem;
    padding: .2rem;
    color: green;
  }
</style>








