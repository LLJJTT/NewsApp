import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/login'
import Register from '@/components/register'
import Index from '@/components/index'
import Recommend from '@/components/recommend'
import Fire from '@/components/fire'
import Find from '@/components/find'
import My from '@/components/my'
import Level from '@/components/level'
import Collection from '@/components/collection'
import Details from '@/components/details'
Vue.use(Router)

export default new Router({
  routes: [{
    	path:'/',
    	redirect:'/index',//直接默认访问地址
    },{
      path: '/login',//就是加载的路径名字
      name: 'login',
      component: Login
    },{
      path: '/register',
      name: 'register',
      component: Register
    },{
    	path:'/index',
      component:Index,
      children:[{
          path:'/',
          redirect: '/index/fire'
        },{
        	path:'recommend',
        	name:'recommend',
        	component:Recommend
        },{
        	path:'fire',
        	name:'fire',
        	component:Fire
        },{
        	path:'find',
        	name:'find',
        	component:Find
        },{
        	path:'my',
        	name:'my',
        	component:My
        },{
          path:'collection',
          name:'collection',
          component:Collection
        },{
          path:'level',
          name:'level',
          component:Level
        },{
          path:'details',
          name:'details',
          component:Details
        }]
  }]
})
