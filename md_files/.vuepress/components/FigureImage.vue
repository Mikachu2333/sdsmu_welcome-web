<template>
  <figure class="figure-image">
    <figcaption class="figure-caption">
      {{ title }}
      <a v-if="downloadLink" :href="withBase(downloadLink)" target="_blank" class="download-btn" title="下载">
        下载
      </a>
    </figcaption>
    <img :src="withBase(src)" :alt="alt || title" class="figure-img" />
  </figure>
</template>

<script setup>
import { withBase } from '@vuepress/client'

defineProps({
  src: {
    type: String,
    required: true
  },
  title: {
    type: String,
    required: true
  },
  alt: {
    type: String,
    default: ''
  },
  downloadLink: {
    type: String,
    default: ''
  }
})
</script>

<style scoped>
.figure-image {
  text-align: center;
  margin: 1.5rem 0;
}

.figure-caption {
  margin-bottom: 0.5rem;
  font-weight: 600;
  font-size: 0.9rem;
  color: var(--c-text-light);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
}

.download-btn {
  font-size: 0.8rem;
  padding: 2px 8px;
  border: 1px solid var(--c-brand);
  border-radius: 4px;
  color: var(--c-brand);
  text-decoration: none;
  transition: all 0.3s;
}

.download-btn:hover {
  background-color: var(--c-brand);
  color: white;
}

.figure-img {
  width: 100%;
  object-fit: cover;
  border-radius: 6px;
}
</style>
