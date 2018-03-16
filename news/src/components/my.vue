<template>
  <div id="my">
    <!-- 头 -->
    <div id="head">
      <span class="name">我的</span>
    </div>
    <!-- userInfo -->
    <div id="head_img">
      <ul>
        <li><img :src="head_imgSrc" alt=""></li>
        <li>{{username}}</li>
      </ul>
    </div>
    <div id="select">
      <ul>
        <li @click="goCollection">
          <img src="../../static/img/collection.png" alt="">&nbsp;&nbsp;<span>我的收藏</span>
        </li>
        
        <li @click="aboutLevel">
          <img src="../../static/img/level.png" alt="">&nbsp;&nbsp;<span>新闻介绍</span>
        </li>
      </ul>
    </div>
    <button id="logout" @click="goLogin">{{login}}</button>
  </div>
</template>
<script>
  import axios from 'axios'
  import { Toast } from 'mint-ui';
  export default{
    data(){
      return{
        head_imgSrc:'static/img/head_img_login.png',
        username:'点击下面去登录按钮',
        login:'去登录',
        userStatus:'',
      }
    },
    methods:{
      goCollection:function(){
        const username = sessionStorage.getItem('username')
        if (username==''||username==null||username==undefined) {
          Toast({
            message: '请先登录',
            position: 'middle',
            duration:2000
          });
        }
        else{
          this.$router.push({
            path:'/index/collection'
          }) 
        }
      },
      aboutLevel:function(){
        this.$router.push({
          path:'/index/level'
        }) 
      },
      goLogin:function(){
        var that = this
        if (this.login=='退出') {
          sessionStorage.removeItem('username')
          sessionStorage.removeItem('loginUser')              
          that.username = '您还未登录'
          that.login = '去登录'
          that.head_imgSrc = 'static/img/head_img_login.png'
        }
        else{
          this.$router.push({
            path:'/login'
          }) 
        }
        
      }
    },
    created:function(){
      this.userStatus = sessionStorage.getItem('username');
      if (this.userStatus!=''&&this.userStatus!=null&&this.userStatus!=undefined) {
        this.head_imgSrc = 'static/img/head_img_unlogin.png'
        this.username= this.userStatus
        this.login = '退出'
      }
    },
  }
</script>

<style scoped>
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
  #select{
    margin-top: 1.8rem;
      
  }
  #select ul li{
    width:90%;
    margin: 0 auto;
    font-size:.8rem;
    font-weight:bold;
    padding:.8rem 0;
    border-bottom:1px solid #d8d8d8;
    text-align:left;
    text-indent:1rem;
  }
  #select ul li img{
    display:inline-block;
    width:1rem;
    height:1rem;
    vertical-align:middle;
  }
  #head_img ul li:first-child{
    margin-top: 1rem;
  }
  #head_img ul li:first-child img{
    vertical-align: middle;
    display: inline-block;
    width: 4rem;
    height: 4rem;
  }
  #head_img ul li:last-child{
    font-size: 1.4rem;
    margin-top: 1.4rem;
    display: inline-block;
    border-bottom: 1px solid red;
    padding-bottom: .2rem;
  }
  #logout{
    width:90%;
    margin: 0 auto;
    background: #2992d9;
    color:#fff;
    padding:.5rem 0;
    border-radius:5px;
    margin-top: 6rem;
    box-shadow:none;
    border:none;
    font-size:.8rem;
    font-weight:bold;
  }
</style>








