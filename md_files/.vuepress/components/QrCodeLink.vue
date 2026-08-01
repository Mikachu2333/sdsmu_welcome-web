<template>
  <span class="qrcode-link-wrapper">
    <span
      ref="triggerRef"
      class="qrcode-trigger"
      :class="{ 'show-below': showBelow, open: isOpen }"
      @mouseenter="openTooltip"
      @mouseleave="closeFromHover"
      @focusin="openTooltip"
      @focusout="closeFromFocus"
    >
      <a
        v-if="href"
        :href="href"
        target="_blank"
        rel="noopener noreferrer"
        :aria-describedby="tooltipId"
        @click.stop
      >
        {{ text }}
      </a>
      <button
        v-else
        type="button"
        class="qrcode-button"
        :aria-expanded="isOpen"
        :aria-describedby="tooltipId"
        @click.stop="toggleTooltip"
        @keydown.esc="closeTooltip"
      >
        {{ text }}
      </button>
      <span :id="tooltipId" class="qrcode-tooltip" role="tooltip">
        <img
          :src="withBase(qrcode)"
          :alt="`${text} 二维码`"
          loading="lazy"
          :style="scaledHeight ? { height: `${scaledHeight}px` } : undefined"
        />
      </span>
    </span>
  </span>
</template>

<script setup lang="ts">
import { withBase } from "@vuepress/client";
import { onBeforeUnmount, onMounted, ref, useId } from "vue";

defineProps<{
  text: string;
  href?: string;
  qrcode: string;
}>();

const triggerRef = ref<HTMLElement | null>(null);
const isOpen = ref(false);
const showBelow = ref(false);
const scaledHeight = ref<number | null>(null);
const tooltipId = `qrcode-${useId()}`;

const updateTooltipPosition = () => {
  if (!triggerRef.value || window.matchMedia("(max-width: 719px)").matches) {
    scaledHeight.value = null;
    return;
  }

  const rect = triggerRef.value.getBoundingClientRect();
  const desiredHeight = 250;
  const viewportPadding = 16;
  const spaceAbove = rect.top;
  const spaceBelow = window.innerHeight - rect.bottom;
  showBelow.value = spaceAbove < desiredHeight && spaceBelow > spaceAbove;

  const availableSpace = (showBelow.value ? spaceBelow : spaceAbove) - viewportPadding;
  scaledHeight.value = availableSpace < desiredHeight
    ? Math.max(80, Math.floor(availableSpace))
    : null;
};

const openTooltip = () => {
  updateTooltipPosition();
  isOpen.value = true;
};

const closeTooltip = () => {
  isOpen.value = false;
};

const toggleTooltip = () => {
  if (isOpen.value) closeTooltip();
  else openTooltip();
};

const closeFromHover = () => {
  if (!triggerRef.value?.contains(document.activeElement)) closeTooltip();
};

const closeFromFocus = (event: FocusEvent) => {
  if (!triggerRef.value?.contains(event.relatedTarget as Node | null)) closeTooltip();
};

const handleDocumentPointerDown = (event: PointerEvent) => {
  if (!triggerRef.value?.contains(event.target as Node)) closeTooltip();
};

const handleDocumentKeyDown = (event: KeyboardEvent) => {
  if (event.key === "Escape") closeTooltip();
};

onMounted(() => {
  document.addEventListener("pointerdown", handleDocumentPointerDown);
  document.addEventListener("keydown", handleDocumentKeyDown);
});

onBeforeUnmount(() => {
  document.removeEventListener("pointerdown", handleDocumentPointerDown);
  document.removeEventListener("keydown", handleDocumentKeyDown);
});
</script>

<style scoped>
.qrcode-trigger {
  position: relative;
  display: inline-block;
}

.qrcode-link-wrapper a,
.qrcode-button {
  color: #0099cc;
  text-decoration: var(--vp-c-text-link-decoration, underline);
  text-decoration-thickness: var(--vp-c-text-link-decoration-thickness, auto);
  text-underline-offset: var(--vp-c-text-link-underline-offset, auto);
  transition: color 0.25s, opacity 0.25s;
  cursor: pointer;
}

.qrcode-button {
  padding: 0;
  border: 0;
  background: transparent;
  font: inherit;
}

.qrcode-link-wrapper a:hover,
.qrcode-button:hover {
  opacity: 0.8;
}

.qrcode-link-wrapper a:visited {
  color: #003399;
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
  box-shadow: 0 2px 12px rgb(0 0 0 / 15%);
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s, visibility 0.3s;
  pointer-events: none;
  z-index: 1000;
  white-space: nowrap;
}

.qrcode-trigger.show-below .qrcode-tooltip {
  top: 100%;
  bottom: auto;
  margin-top: 10px;
  margin-bottom: 0;
}

html.dark .qrcode-tooltip {
  background: #1e1e1e;
  border-color: #444;
  box-shadow: 0 2px 12px rgb(0 0 0 / 50%);
}

.qrcode-tooltip img {
  display: block;
  width: 200px;
  max-width: 90vw;
  height: auto;
}

.qrcode-trigger.open .qrcode-tooltip {
  opacity: 1;
  visibility: visible;
}

.qrcode-tooltip::after {
  content: "";
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

.qrcode-trigger.show-below .qrcode-tooltip::after {
  top: auto;
  bottom: 100%;
  border-top-color: transparent;
  border-bottom-color: white;
}

html.dark .qrcode-trigger.show-below .qrcode-tooltip::after {
  border-bottom-color: #1e1e1e;
}

@media (min-width: 720px) and (max-width: 1279px) {
  .qrcode-tooltip img {
    width: 250px;
  }
}

@media (min-width: 1280px) {
  .qrcode-tooltip img {
    width: 15vw;
    max-width: 400px;
  }
}

@media (max-width: 719px) {
  .qrcode-trigger .qrcode-tooltip,
  .qrcode-trigger.show-below .qrcode-tooltip {
    position: fixed;
    inset: 50% auto auto 50%;
    transform: translate(-50%, -50%);
    margin: 0;
    z-index: 2000;
    max-width: 75vw;
  }

  .qrcode-tooltip::after {
    display: none;
  }

  .qrcode-tooltip img {
    width: 50vw;
    max-width: 250px;
  }
}
</style>
