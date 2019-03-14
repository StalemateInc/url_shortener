<template>
    <input id="shortener-link-input" class="form-control px-3 big-input" placeholder="Enter your link here..." name="link" type="text" />
</template>

<script>
    export default {
        name: "ShortenerInput"
    }
</script>

<style scoped>
    .big-input {
        font-size: 40pt;
    }
    .big-input::placeholder {
        opacity: 0.5;
    }
</style>