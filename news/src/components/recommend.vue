<template>
  <div id="recommend">
    <!-- 头 -->
    <div id="head">
      <span class="name">推荐</span>
    </div>
    <!-- 推荐list -->
    <div @click="goDetails(item)" class="wrapper" v-for="item in recommendData">
      <div class="left">
        <img class="newsimg" :src="item.img_src" alt="">
      </div>
      <div class="right">
        <ul>
          <li class="newstitle">{{item.newstitle}}</li>
          <li class="fi"><span class="newstime">{{item.newstime}}</span><span class="newscomment"><i>评论数&nbsp;&nbsp;</i>{{item.comment}}</span></li>
        </ul>
      </div>
      <div style="clear:both"></div>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  export default{
    data(){
      return{
        url:'http://112.74.63.14/NewsApp/php/recommend.php',
        recommendData:[]
      }
    },
    methods:{
      goDetails(item){
        console.log(item)
          this.$router.push({
            name:'details',
            params:{
              detailData:item
            }
          })
      },
      // 获取数据
      getRecommendData(){
        axios({
          method:'GET',
          url:this.url,
          config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
        })
        .then((res) =>{
          this.recommendData = res.data
          // console.log(res.data)
        })

      }
    },
    created:function(){
      this.getRecommendData()
    },
  }
</script>

<style scoped>
  #recommend{
    max-height:35rem;
    overflow:auto; 
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
  .name{
    font-size:.9rem;
  }
  .left{
    float: left;
  }
  .wrapper{
    padding: .4rem 1rem;
    background: #fff;
    margin-top: .8rem;
    border-bottom: 1px solid #aaa9e2;
  }
  .left img{
    width: 10rem;
    height: 5rem;
    padding: .2rem;
  }
  .right{
    float: right;
  }
  .newstitle{
    margin-top: .24rem;
    max-width: 10rem;
    overflow: hidden;
    text-overflow:ellipsis;
    white-space: nowrap;
    font-size: .9rem;
  }
  .fi{
    margin-top: 2rem;
  }
  .newstime{
    color: #4a7d54;
    font-size: .4rem;
  }
  .newscomment{
    margin-left: 1rem;
    font-size: .4rem;
    color: red;
  }
</style>








