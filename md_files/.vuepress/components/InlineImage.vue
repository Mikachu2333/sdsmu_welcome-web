<template>
  <img :src="withBase(src)" :alt="alt" class="inline-image" />
</template>

<script setup>
import { withBase } from '@vuepress/client'

defineProps({
  src: {
    type: String,
    required: true
  },
  alt: {
    type: String,
    default: 'icon'
  }
})
</script>

<style scoped>
.inline-image {
  height: 1.2em;
  width: auto;
  vertical-align: text-bottom;
  margin: 0 0.2em;
  display: inline-block;
}
</style>
