<template>
  <div>
    Hello Users
  </div>
</template>
<script>
export default {
  props: {
    users: {
      type: Array,
    }
  },
  mounted() {
    console.log(this.users);
  }
}
</script>
<style>
  
</style>