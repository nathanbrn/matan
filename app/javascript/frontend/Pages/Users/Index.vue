<template>
  <div>
    Hello Users
    
    <Link href="/users/new">Novo usuário</Link>
  </div>
</template>
<script>
import { Link } from '@inertiajs/inertia-vue3';
export default {
  props: {
    users: {
      type: Array,
    }
  },
  components: {
    Link,
  }
}
</script>
<style>
  
</style>