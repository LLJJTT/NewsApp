<template>
  <div id="collection">
    <!-- 头 -->
    <div id="head">
      <i @click="prev" class="el-icon-back prev"></i>
      <span class="name">收藏</span>
    </div>
    <div>
      <li @click="goDetail(item)" v-for="item in infoData" :style="s1" class="newslist">{{item.newstitle}}</li>
      <li class="s2" :style="s2">你还没有收藏</li>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import {Toast} from 'mint-ui'
  export default{
    data(){
      return{
        findlist:'http://112.74.63.14/NewsApp/php/collection_list_find.php',
        infoData:[],
        s1:'display:block',
        s2:'display:none'
      }
    },
    methods:{
      prev:function(){
        this.$router.push({
          path:'/index/my'
        })
      },
      goDetail(item){
        this.$router.push({
          name:'details',
          params:{
            detailData:item,
            collectionType:'find'
          }
        })
      },
      getFireListData(){
        const user_id = JSON.parse(sessionStorage.loginUser).data.user_id
        // const username = sessionStorage.getItem('username')
        var formdata = new FormData()
        formdata.append('user_id',user_id)
        axios({
          method:'POST',
          data:formdata,
          url:this.findlist,
          config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
        })
        .then((res) =>{
          this.infoData = res.data
          console.log(this.infoData.msg)
          if (res.data.status==0) {
            this.s1 = 'display:none'
            this.s2 = 'display:block'
          }
          else{
            this.s2 = 'display:none'
            this.s1 = 'display:block'
          }
        })
        .catch((res) =>{
          Toast({
            message: '未知错误',
            position: 'middle',
            duration:2000
          });
        })
      }
    },
    created:function(){
      this.getFireListData()
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
  .newslist{
    padding:.4rem .6rem;
    margin-top: .4rem;
    text-align: left;
    overflow: hidden; 
    text-overflow: ellipsis; 
    white-space:nowrap;
    font-size: 1rem;
    background: #dcdbdb;
  }
  .s2{
    margin-top: 6rem;
    font-size: 1.2rem;
    color: blue;
  }
</style>








