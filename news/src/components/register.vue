<template>
  <div class="register">
  	<!-- head -->
    <div id="title">
			注册
		</div>
		<!-- logo -->
		<div class="top wrapper">
  		<li>
  			<img class="logo" src="../../static/img/logo.png">
  		</li>
  	</div>
  	<!-- 输入框 -->
  	<div class="indiv wrapper1">
			<li>
				<input class="number inp" v-model="phonenumber" placeholder="请输入手机号" type="text">
			</li>
			<li>
				<input class="pwd inp" v-model="pwd1" placeholder="请输入密码" type="password">
			</li>
			<li>
				<input class="pwd2 inp" v-model="pwd2" placeholder="请再次输入密码" type="password">
			</li>
			<li class="fun">
				<span class="goregister" @click="goLogin">去登录</span>
				<div style="clear:both"></div>
			</li>
			<li>
				<button class="btn" @click="nowRegister">立即注册</button>
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
    	phonenumber:'',
    	pwd1:'',
    	pwd2:'',
    	url:'http://112.74.63.14/NewsApp/php/register.php'
    }
  },
  methods:{
  	goLogin:function(){
			history.back();
  	},
		nowRegister:function(){
			const reg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (this.phonenumber=='') {
				Toast({
				  message: '请输入手机号',
				  position: 'middle',
				  duration:1000
				});
			}
			else if (reg.test(this.phonenumber)!=true) {
				Toast({
				  message: '请输入正确手机号',
				  position: 'middle',
				  duration:1000
				});
			}
			else if (this.pwd1=='') {
				Toast({
				  message: '请输入密码',
				  position: 'middle',
				  duration:1000
				});
			}
			else if (this.pwd1.length<6||this.pwd1.length>11) {
				Toast({
				  message: '密码长度在6-11位',
				  position: 'middle',
				  duration:1000
				});
			}
			else if (this.pwd2=='') {
				Toast({
				  message: '请再次输入密码',
				  position: 'middle',
				  duration:1000
				});
			}
			else if(this.pwd1!=this.pwd2){
				Toast({
				  message: '两次密码不一致',
				  position: 'middle',
				  duration:1000
				});
			}
			else{
				console.log(this.phonenumber)
				console.log(this.pwd2)
				var that  = this
				var formdata = new FormData()
				formdata.append('username',this.phonenumber)
				formdata.append('pwd',this.pwd2)
				axios({
					method:"POST",
			    url:this.url,
			    data:formdata,
      		config: { headers: {'Content-Type': 'application/x-www-form-urlencoded' }}
				})
				.then(res => {
					console.log(res.data)
					if (res.data.status==0) {
						Toast({
						  message: '用户已经存在',
						  position: 'middle',
						});
					}
					else if (res.data.status==1){
						// 注册成功之后存USER-infomation-session
						sessionStorage.setItem('username',this.username);
						const loginUser = JSON.stringify(res)
						sessionStorage.loginUser = loginUser
						Toast({
						  message: '注册成功',
						  position: 'middle',
						  duration:2000,
						});
						// 跳转主页
						that.$router.push({
							path:'/index/fire'
						})
					}
					else{
						Toast({
						  message: '注册失败',
						  position: 'middle',
						});
					}
				})
				.catch(error =>{
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
	.wrapper{
		padding: 3rem 1rem 0rem 1rem;
	}
	.wrapper1{
		padding: 0rem 1rem 0rem 1rem;
	}
	.logo{
		width: 6rem;
		height:6rem;
		margin: 0 auto;
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
</style>
