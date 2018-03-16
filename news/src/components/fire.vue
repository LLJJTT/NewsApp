<template>
  <div id="fire">
    <!-- 头 -->
    <div id="head">
      <span class="name">热点</span>
    </div>
    <!-- 轮播图 -->
     <div class="block">
      <el-carousel height="150px"
      arrow="hover" >
        <el-carousel-item v-for="item in swiper" :key="item.index">
          <img :src="item.src" alt="">
        </el-carousel-item>
      </el-carousel>
    </div>

    <!-- 搜索框 -->
    <mt-search
      v-model="searchVal"
      cancel-text="取消"
      placeholder="搜索">
    </mt-search>

    <!-- 热点新闻list -->
    <div class="newslist">
      <ul v-for="item in newslist">
        <li class="newstitle">{{item.newstitle}}</li>
        <li><img class="newsimg" :src="item.src"><div style="clear:both"></div></li>
        <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
      </ul>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import { Swipe, SwipeItem } from 'mint-ui';
  export default{
    data(){
      return{
        url:'http://localhost/NewsApp/php/fire.php',
        searchVal:'',
        swiper:[{
          src:'static/img/news1.jpg'
        },{
          src:'static/img/news2.jpg',
        },{
          src:'static/img/news3.jpg',
        },{
          src:'static/img/news4.jpg',
        }],
        newslist:[]
      }
    },
    methods:{
      getFireData:function(){
        axios({
          method:'GET',
          url:this.url,
          config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
        })
        .then((res) =>{
          this.newslist = res.data
          console.log(res.data)
        })
      }
    },
    created:function(){
      this.getFireData();
    },
  }
</script>

<style scoped>
  #fire{
    height: 100%;
    overflow: hidden;
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
  .block img{
    background-size: cover;
    width: 100%;
    height: 100%;
  }
  .name{
    font-size:.9rem;
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 150px;
    margin: 0;
  }
  .el-carousel__item:nth-child(2n) {
     background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }
  .newslist{
    width: 100%;
    /*background: #aaa;*/
    margin-top: 12px;
    overflow: auto;
    height:22rem;
  }
  .newslist ul{
    background: #fff;
    padding: .8rem 0rem;
    margin-top: .8rem;
    border-bottom: 1px solid #aaa9e2;
  }
  .mint-search{
    height: inherit;
  }
  .newstitle{
    padding: 0 1rem;
    font-size: .8rem;
    text-align: left;
  }
  .newsimg{
    width: 6rem;
    height: 2rem;
    float: right;
    margin-right: 1rem;
  }
  .newstime{
    text-indent: 1rem;
    float: left;
  }
  .newstype{
    margin-left: 6rem;
    float: left;
  }
</style>








