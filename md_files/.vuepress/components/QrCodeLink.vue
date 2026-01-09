<template>
    <span class="qrcode-link-wrapper">
        <span 
            class="qrcode-trigger" 
            ref="triggerRef"
            @mouseenter="updateTooltipPosition"
            :class="{ 'show-below': showBelow }"
        >
            <a v-if="href" :href="href" target="_blank" rel="noopener noreferrer">
                {{ text }}
            </a>
            <span v-else>{{ text }}</span>
            <span class="qrcode-tooltip">
                <img 
                    :src="withBase(qrcode)" 
                    :alt="`${text} 二维码`" 
                    :style="needsScaling && scaledHeight ? { width: 'auto', height: `${scaledHeight}px`, maxWidth: 'none' } : {}"
                />
            </span>
        </span>
    </span>
</template>

<script setup lang="ts">
import { withBase } from '@vuepress/client'
import { ref } from 'vue'

const props = defineProps<{
    text: string
    href?: string
    qrcode: string
}>()

const triggerRef = ref<HTMLElement | null>(null)
const showBelow = ref(false)
const needsScaling = ref(false)
const scaledHeight = ref<number | null>(null)

const updateTooltipPosition = () => {
    if (!triggerRef.value) return
    
    const rect = triggerRef.value.getBoundingClientRect()
    const tooltipHeight = 250 // 估算tooltip高度（包括图片和padding）
    const padding = 30 // tooltip的padding和margin
    const spaceAbove = rect.top
    const spaceBelow = window.innerHeight - rect.bottom
    
    // 选择空间更大的一侧
    const useBelow = spaceAbove < tooltipHeight && spaceBelow > spaceAbove
    showBelow.value = useBelow
    
    // 检查选中侧的空间是否足够
    const availableSpace = useBelow ? spaceBelow : spaceAbove
    
    if (availableSpace < tooltipHeight) {
        // 空间不足，需要缩放到可用高度的1/2
        needsScaling.value = true
        scaledHeight.value = Math.floor((availableSpace - padding) / 2)
    } else {
        needsScaling.value = false
        scaledHeight.value = null
    }
}
</script>

<style scoped>
.qrcode-trigger {
    position: relative;
    display: inline-block;
}

.qrcode-link-wrapper a,
.qrcode-link-wrapper>.qrcode-trigger>span {
    color: #0099CC;
    text-decoration: var(--vp-c-text-link-decoration, underline);
    text-decoration-thickness: var(--vp-c-text-link-decoration-thickness, auto);
    text-underline-offset: var(--vp-c-text-link-underline-offset, auto);
    transition: color 0.25s, opacity 0.25s;
    cursor: pointer;
}

.qrcode-link-wrapper a:hover,
.qrcode-link-wrapper>.qrcode-trigger>span:hover {
    opacity: 0.8;
}

.qrcode-tooltip {
    position: absolute;
    bottom: 100%;
    left: 50%;
    transform: translateX(-50%);
    margin-bottom: 10px;
    padding: 8px;
    background: white;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s, visibility 0.3s;
    pointer-events: none;
    z-index: 1000;
    white-space: nowrap;
}

/* 当显示在下方时 */
.qrcode-trigger.show-below .qrcode-tooltip {
    bottom: auto;
    top: 100%;
    margin-bottom: 0;
    margin-top: 10px;
}

html.dark .qrcode-tooltip {
    background: #1e1e1e;
    border-color: #444;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.5);
}

.qrcode-tooltip img {
    display: block;
    width: 200px;
    max-width: 90vw;
    height: auto;
}

/* 平板端：适中尺寸 */
@media (min-width: 720px) and (max-width: 1279px) {
    .qrcode-tooltip img {
        width: 250px;
    }
}

/* 电脑端：更大的尺寸便于扫描 */
@media (min-width: 1280px) {
    .qrcode-tooltip img {
        width: 15vw;
        max-width: 400px;
    }
}

/* 手机端：占屏幕宽度的 60% 或最大 250px */
@media (max-width: 719px) {
    .qrcode-tooltip img {
        width: 60vw;
        max-width: 250px;
    }
}

.qrcode-trigger:hover .qrcode-tooltip {
    opacity: 1;
    visibility: visible;
}

/* 添加一个小三角形指示器 */
.qrcode-tooltip::after {
    content: '';
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    border: 6px solid transparent;
    border-top-color: white;
}

html.dark .qrcode-tooltip::after {
    border-top-color: #1e1e1e;
}

/* 显示在下方时，三角形指向上方 */
.qrcode-trigger.show-below .qrcode-tooltip::after {
    top: auto;
    bottom: 100%;
    border-top-color: transparent;
    border-bottom-color: white;
}

html.dark .qrcode-trigger.show-below .qrcode-tooltip::after {
    border-bottom-color: #1e1e1e;
}
</style>
