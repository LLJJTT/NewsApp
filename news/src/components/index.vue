<template>
  <div class="index">
  	<v-nav></v-nav>
    <router-view></router-view>
  </div>
</template>
<script>
import Navigation from '@/components/navigation'
export default {
  data () {
    return {
    }
  },
  components:{
  	'v-nav':Navigation
  }
}
</script>

<style scoped>

</style>
