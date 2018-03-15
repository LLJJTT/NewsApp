<template>
  <div id="collection">
    <!-- 头 -->
    <div id="head">
      <i @click="prev" class="el-icon-back prev"></i>
      <span class="name">收藏</span>
    </div>
    <div>
      收藏列表样式还没写，数据也没写
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  export default{
    data(){
      return{
        
      }
    },
    methods:{
      prev:function(){
        this.$router.push({
          path:'/index/my'
        })
      },
    },
    created:function(){
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
</style>








