<template>
  <div class="nav">
  	<mt-tabbar class="bar" v-model="selected">
		  <mt-tab-item id="热点">
		  	<img slot="icon" src="../../static/img/fire.png">
		    热点
		  </mt-tab-item>
		  <mt-tab-item id="推荐">
		  	<img slot="icon" src="../../static/img/recommend.png">
		    推荐
		  </mt-tab-item>
		  <mt-tab-item id="发现">
		  	<img slot="icon" src="../../static/img/find.png">
		    发现
		  </mt-tab-item>
		  <mt-tab-item id="我的">
		  	<img slot="icon" src="../../static/img/my.png">
		    我的
		  </mt-tab-item>
		</mt-tabbar>
</div>
</template>
<script>
import { Toast } from 'mint-ui';
import axios from 'axios'
import { Tabbar, TabItem } from 'mint-ui'
export default {
  data () {
    return {
    	selected:'',
    }
  },
  methods:{
  	
  },
  watch:{
  	selected: function (val, oldVal) {
      // 这里就可以通过 val 的值变更来确定，你当前点的是哪个
      if (val=='推荐') {
      	this.$router.push({
      		path:'/index/recommend'
      	})
      }
      else if (val=='热点') {
      	this.$router.push({
      		path:'/index/fire'
      	})
      }
      else if (val=='发现') {
      	this.$router.push({
      		path:'/index/find'
      	})
      }
      else if (val=='我的') {
      	this.$router.push({
      		path:'/index/my'
      	})
      }
    }
  }
}
</script>

<style scoped>
	.nav{
	}
	.bar{
		background: #e6e6e6;
	}
	.mint-tabbar > .mint-tab-item.is-selected{
		    background-color: #cccdd2;
	}
</style>









