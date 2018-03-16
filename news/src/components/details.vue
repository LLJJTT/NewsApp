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
        <textarea class="say"  cols="40" rows="3" placeholder="输入评论"></textarea>
        <el-button class="suresay" type="primary">确定</el-button>
        <div style="clear:both"></div>
      </li>
      <li class="other">
        <p>其他人的评论，大家都能看见</p>
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
        collectionStatus:0,
      }
    },
    methods:{
      // 返回
      prev:function(){
        history.back()
      },
      // 点击收藏
      goCollection(){
        const username = sessionStorage.getItem('username')
        const user_id = JSON.parse(sessionStorage.loginUser).data.user_id
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
          if (this.collectionStatus==0) {
            // 判断收藏的类别-三种类别，find,fire,recommend
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
                  this.off = 'el-icon-star-on'
                  Toast({
                    message: '收藏成功',
                    position: 'middle',
                    duration:1000
                  });
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
      }
    },
    created:function(){
      this.detailData = this.$route.params.detailData
      this.collectionType = this.$route.params.collectionType
      this.collectionStatusIf()
    },
  }
</script>

<style scoped>
  #details{
    height: 35rem;
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
    color: #6f6e6e;
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








