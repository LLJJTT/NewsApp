<template>
  <div id="recommend">
    <!-- 头 -->
    <div id="head">
      <span class="name">推荐</span>
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
  .name{
    font-size:.9rem;
  }
</style>








