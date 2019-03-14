<template>
    <input id="shortener-link-input" class="form-control px-3 big-input"
           placeholder="Enter your link here..."
           name="original"
           type="text"
           autocomplete="off"
           v-model="original"
    />
</template>

<script>
    export default {
        name: "ShortenerInput",
        data: function() {
            return {
                original: this.original
            }
        }
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