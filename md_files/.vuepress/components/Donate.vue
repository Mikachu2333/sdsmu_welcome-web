<template>
    <p style="text-align:center;color:DeepPink;font-weight:bold;font-size:1.5em;">感觉有帮助？请我喝杯咖啡～</p>
    <br />
    <p style="text-align:center; color:red; font-size:1.5em;">☆*:.｡.o(≧▽≦)o.｡.:*☆</p>

    <div class="donate-container">
        <img :src="withBase('/resources/pay/Ali_pay.png')" alt="支付宝" class="donate-img" />

        <img :src="withBase('/resources/pay/Wechat_pay.png')" alt="微信支付" class="donate-img" />
    </div>
</template>

<script setup>
import { withBase } from '@vuepress/client'
</script>

<style scoped>
.donate-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10%;
    margin-top: 30px;
    margin-bottom: 50px;
}

.donate-img {
    width: 25%;
    object-fit: cover;
}

@media (max-width: 719px) {
    .donate-container {
        gap: 10%;
    }

    .donate-img {
        width: 40%;
    }
}
</style>
