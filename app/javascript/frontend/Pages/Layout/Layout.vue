<script setup>
import { Link, router } from "@inertiajs/inertia-vue3";
import { ref } from 'vue'
import FlashMessage from "./FlashMessage.vue";

const openSidebar = ref(false)
const page = ref('/')

router.on('finish', (event) => {
  openSidebar.value = false
})

router.on('navigate', (event) => {
  page.value = event.detail.page.component
})

const checkMessage=(flash)=>{
  console.log(flash)
  return Object.keys(flash).length > 0
}
</script>

<template>
  <div class="wrapper-page" :class="{'open-sidebar': openSidebar}">
    <div class="overlay" @click="openSidebar = !openSidebar"></div>
    <header class="d-flex align-items-center justify-content-between ">
      <button class="btn text-light" @click="openSidebar = !openSidebar">
        <i class="fa-solid fa-bars"></i>
      </button>
      <Link href="/" class="text-light">
        <i class="fa-solid fa-wallet"></i><span class="ms-1 d-inline-block fw-bold">CyberFIN</span>
      </Link>
      <span></span>
    </header>
    <main>
      <aside>
        <header class="d-flex justify-content-between align-items-center">
          <span>
            <i class="fa-solid fa-wallet"></i><span class="ms-1 d-inline-block fw-bold">CyberFIN</span>
          </span>
          <button type="button" class="btn" @click="openSidebar = !openSidebar">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </header>
        <ul>
          <li><Link href="/">Início</Link></li>
          <li><Link href="/categories/">Categorias</Link></li>
          <li><Link href="/entries/new?tipo=1">Nova receita</Link></li>
          <li><Link href="/entries/new?tipo=2">Nova despesa</Link></li>
        </ul>
      </aside>
      <section :class="{'container-fluid': page !='dash/index'}">
        <slot></slot>
        <FlashMessage v-if="checkMessage($page.props.flash)" :message="$page.props.flash"/>
      </section>
    </main>
  </div>
</template>