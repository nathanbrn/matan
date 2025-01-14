<template>
  <div class="toast-container position-fixed top-0 end-0 p-3">
    <div class="toast align-items-center border-0" :class="`${show ? 'show':''} text-bg-${classname}`" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body" v-html="show"></div>
        <button type="button" @click="closeToast" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</template>
<script>
import { ref } from 'vue'
export default {
  name:'FlashMessage',
  props:{
    message:Object
  },
  methods:{
    closeToast(){
      this.show = null
      this.classname = null
      this.$page.props.flash = {}
    }
  },
  setup(props){
    let _message;
    let name;
    for(let n in props.message){
      name = n
      if(Array.isArray(props.message[n])){
        _message = props.message[n].join('<br>')
      } else {
        _message = props.message[n]
      }
    }
    const show = ref(_message)
    const classname = ref(name == 'notice' ? 'success': 'danger')
    return { show, classname }
  }
}
</script>
