<template>
  <div class="login">
  	<!-- head -->
  	<div id="title">
			登录
		</div>
  	<!-- logo -->
  	<div class="top wrapper">
  		<li>
  			<img class="logo" src="../../static/img/logo.png">
  		</li>
  		<li>
    		<p class="welcome">欢迎登录新闻App</p>
  		</li>
  	</div>
  	<!-- 输入框 -->
		<div class="indiv wrapper1">
			<li>
				<input class="number inp" v-model="username" placeholder="请输入手机号" type="text">
			</li>
			<li>
				<input class="pwd inp" v-model="pwd" placeholder="请输入密码" type="password">
			</li>
			<li class="fun">
				<span class="goregister" @click="goRegister">去注册</span><span @click="forget" class="forget">忘记密码</span>
				<div style="clear:both"></div>
			</li>
			<li>
				<button @click="goLogin" class="btn">登录</button>
			</li>
		</div>
  </div>
</template>
<script>
import { Toast } from 'mint-ui';
import { MessageBox } from 'mint-ui';
import axios from 'axios'
export default {
  data () {
    return {
    	username:'',
    	pwd:'',
		  url:'http://112.74.63.14/NewsApp/php/login.php'
    }
  },
  methods:{
  	forget:function(){
  		Toast({
			  message: '请联系开发者-何润新',
			  position: 'middle',
			  duration:2000
			});
  	},
  	goRegister:function(){
  		this.$router.push({
  			path:'register'
  		})
  	},
		goLogin:function(){
			const reg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (this.username=='') {
				Toast({
				  message: '请输入手机号',
				  position: 'middle',
				  duration:1000,
				});
			}
			else if (reg.test(this.username)!=true) {
				Toast({
				  message: '请输入正确手机号',
				  position: 'middle',
				  duration:1000
				});
			}
			else if (this.pwd=='') {
				Toast({
				  message: '请输入密码',
				  position: 'middle',
				  duration:1000
				});
			}
			else if (this.pwd.length<6||this.pwd.length>11) {
				Toast({
				  message: '密码长度在6-11位',
				  position: 'middle',
				  duration:1000
				});
			}
			else{
				var formdata = new FormData()
				formdata.append('username',this.username)
				formdata.append('pwd',this.pwd)
				axios({
					method:"POST",
			    url:this.url,
			    data:formdata,
      		config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
				})
				.then((res) =>{ 
					var that =this
					if (res.data.status==2) {//密码错误
						Toast({
						  message: '密码错误',
						  position: 'middle',
						  duration:1000
						});
					}
					else if(res.data.status==1){//登录成功
						// 登录之后存USER-infomation-session
						sessionStorage.setItem('username',this.username);
						const loginUser = JSON.stringify(res)
						sessionStorage.loginUser = loginUser
						Toast({
						  message: '登录成功',
						  position: 'middle',
						  duration:2000,
						});
						// 跳转我的
						that.$router.push({
							path:'/index/my'
						})
					}
					else if (res.data.status==0){//用户还没注册
						Toast({
						  message: '用户还没注册',
						  position: 'middle',
						  duration:1000
						});
					}
				})
				.catch(error =>{
					console.log(error)
					Toast({
					  message: '未知错误',
					  position: 'middle',
					});
				})
			}
		}
  }
}
</script>

<style scoped>
	.login{
		/*background: #aaa;*/
		height: 100%;
	}
	.wrapper{
		padding: 3rem 1rem 0rem 1rem;
	}
	.wrapper1{
		padding: 0rem 1rem 0rem 1rem;
	}
	.logo{
		width: 6rem;
		height:4rem;
	}
	.welcome{
		text-align: left;
		font-size: 1.3rem;
	}
	.indiv{
		margin-top: 1rem;
	}
	.inp{
		box-shadow: none;
		border: none;
		border-bottom: 1px solid #000;
		margin-top: 1rem;
		width: 100%;
		padding: .8rem 0;
		text-indent: 1rem;
	}
	.goregister{
		float: left;
		margin-left: .5rem;
	}
	.forget{
		float: right;
	}
	.fun{
		margin-top: 1rem;
		padding: 0 .5rem;
		color: #65686b;
		font-weight: 400;
		font-size: .4rem;
	}
	.btn{
		border: none;
		box-shadow: none;
		width: 90%;
		background: #548fca;
		padding: .5rem 0;
		border-radius: .4rem;
		color: #fff;
		margin-top: 2rem;
	}
	#title{
		background: #2992d9;
    padding:.4rem 0;
    font-size:1rem;
    font-weight:bold;
    letter-spacing:.12rem;
    color:#fff;
   }
  .prev{
		font-weight:bold;
		position:absolute;
		left:1rem;
		top:.1rem;
		padding:.5rem;
	}
</style>









