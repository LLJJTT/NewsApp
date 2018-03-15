<template>
  <div id="fire">
    <!-- 头 -->
    <div id="head">
      <span class="name">热点</span>
    </div>
    <!-- 轮播图 -->
     <div class="block">
      <el-carousel height="150px">
        <el-carousel-item v-for="item in 4" :key="item">
          <h3>{{ item }}</h3>
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
      <ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
      </ul>
      <ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
      </ul>
      <ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
      </ul>
      <ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
      </ul><ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
      </ul><ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
      </ul><ul>
        <li class="newstitle">习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的习近平怎么怎么的了啥的乱糟的啥的</li>
        <li><img class="newsimg" src="../../static/img/logo.png"><div style="clear:both"></div></li>
        <li><span class="newstime">2018-5-26</span><span class="newstype">政治类</span><div style="clear:both"></div></li>
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
        searchVal:'',
      }
    },
    methods:{
      
    },
    created:function(){
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
    border-bottom: 1px solid #000;
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








