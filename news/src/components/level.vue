<template>
  <div id="level">
    <!-- 头 -->
    <div id="head">
      <i @click="prev" class="el-icon-back prev"></i>
      <span class="name">版本信息</span>
    </div>
    新闻，是指报纸、电台、电视台、互联网等媒体经常使用的记录与传播信息的一种文体。是记录社会、传播信息、反映时代的一种文体。新闻概念有广义与狭义之分。广义上：除了发表于报刊、广播、互联网、电视上的评论与专文外的常用文本都属于新闻，包括消息、通讯、特写、速写（有的将速写纳入特写之列）等等；狭义上：消息是用概括的叙述方式，以较简明扼要的文字，迅速及时地报道附近新近发生的、有价值的事实，使一定人群了解。新闻一般包括标题、导语、主体、背景和结语五部分。前三者是主要部分，后二者是辅助部分。写法以叙述为主兼或有议论、描写、评论等。新闻是包含海量资讯的新闻服务平台,真实反映每时每刻的重要事件。您可以搜索新闻事件、热点话题、人物动态、产品资讯等,快速了解它们的最新进展。
    <h1>随便粘贴的</h1>
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








