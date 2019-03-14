<template>
    <button type="submit" class="btn btn-lg btn-primary big-button">Shorten me!</button>
</template>

<script>
    export default {
        name: "ShortenerSubmutButton"
    }
</script>

<style scoped>
    .big-button {
        font-size: 30pt;
        background-color: #3dd099;
        border-color: #3dd099;
    }
    .big-button:hover {
        background-color: #2a8561;
        border-color: #2a8561;
    }
    .big-button:active {
        background-color: #3dd099 !important;
        border-color: #3dd099;
    }
    .big-button:focus {
        box-shadow: 0 0 0 0.2rem rgba(67,244,183,.5) !important;
    }
    .big-button:active:focus {
        box-shadow: 0 0 0 0.2rem rgba(67,244,183,.5);
    }
</style>
