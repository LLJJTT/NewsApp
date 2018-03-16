<template>
  <div id="find">
    <!-- 头 -->
    <div id="head">
      <span class="name">发现</span>
    </div>
    <!-- 分类 -->
    <mt-navbar v-model="selected">
      <mt-tab-item id="1">生活</mt-tab-item>
      <mt-tab-item id="2">政治</mt-tab-item>
      <mt-tab-item id="3">军事</mt-tab-item>
      <mt-tab-item id="4">科技</mt-tab-item>
      <mt-tab-item id="5">国际</mt-tab-item>
      <mt-tab-item id="6">娱乐</mt-tab-item>
      <mt-tab-item id="7">体育</mt-tab-item>
    </mt-navbar>

<!-- tab-container -->
<mt-tab-container v-model="selected">
  <mt-tab-container-item class="newslist" id="1">
    <ul v-for="item in shenghuo">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
  <mt-tab-container-item class="newslist" id="2">
    <ul v-for="item in zhengzhi">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
  <mt-tab-container-item class="newslist" id="3">
    <ul v-for="item in junshi">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
  <mt-tab-container-item class="newslist" id="4">
    <ul v-for="item in keji">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
  <mt-tab-container-item class="newslist" id="5">
    <ul v-for="item in guoji">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
  <mt-tab-container-item class="newslist" id="6">
    <ul v-for="item in yule">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
  <mt-tab-container-item class="newslist" id="7">
    <ul v-for="item in tiyu">
      <li class="newstitle">{{item.newstitle}}</li>
      <li><img class="newsimg" :src="item.img_src"><div style="clear:both"></div></li>
      <li><span class="newstime">{{item.newstime}}</span><span class="newstype">{{item.type_name}}</span><div style="clear:both"></div></li>
    </ul>
  </mt-tab-container-item>
</mt-tab-container>
  </div>
</template>
<script>
  import axios from 'axios'
  export default{
    data(){
      return{
        selected:'',
        newslist:[],
        url:'http://112.74.63.14/NewsApp/php/newslist.php',
        shenghuo:[],
        zhengzhi:[],
        junshi:[],
        keji:[],
        guoji:[],
        yule:[],
        tiyu:[],
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
          var that = this
          this.newslist.map(function(val,index,array){
            if (val.newstype==1) {
              that.shenghuo.push(val)
            }
            else if (val.newstype==2) {
              that.zhengzhi.push(val)
            }
            else if (val.newstype==3) {
              that.junshi.push(val)
            }
            else if (val.newstype==4) {
              that.keji.push(val)
            }
            else if (val.newstype==5) {
              that.guoji.push(val)
            }
            else if (val.newstype==6) {
              that.yule.push(val)
            }
            else if (val.newstype==7) {
              that.tiyu.push(val)
            }
          })
        })
      }
    },
    created:function(){
      this.getFireData();

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
  .newslist{
    max-height:30rem;
    overflow:auto; 
  }
  .newslist ul{
    background: #fff;
    padding: .8rem 0rem;
    margin-top: .8rem;
    border-bottom: 1px solid #aaa9e2;
    height: 
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
  .mint-tab-container{
    overflow: auto;
    height: 31rem;
  }
</style>








