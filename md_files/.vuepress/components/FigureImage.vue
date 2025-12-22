<template>
    <figure class="figure-image">
        <figcaption class="figure-caption">{{ title }}</figcaption>
        <img :src="src" :alt="alt || title" class="figure-img" />
    </figure>
</template>

<script setup>
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
}

.figure-img {
    width: 100%;
    object-fit: cover;
    border-radius: 6px;
}
</style>
