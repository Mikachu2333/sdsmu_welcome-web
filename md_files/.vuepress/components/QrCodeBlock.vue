<template>
  <p class="qrcode-block-wrapper">
    <QrCodeLink :text="text" :href="href" :qrcode="qrcode" />
  </p>
</template>

<script setup lang="ts">
import QrCodeLink from "./QrCodeLink.vue";

defineProps<{
  text: string;
  href?: string;
  qrcode: string;
}>();
</script>

<style scoped>
.qrcode-block-wrapper {
  margin: 1rem 0;
}
</style>
