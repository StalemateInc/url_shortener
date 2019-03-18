<template>
    <div id="app" class="container">
        <div class="row full-height-container">
            <div class="col-12">
                <div class="text-center">
                    <shortener-form />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import ShortenerForm from "../components/ShortenerForm";
    export default {
        name: "IndexPage",
        components: { ShortenerForm }
    }
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }
    .full-height-container {
        min-height: 90vh;
        display: flex;
        align-items: center;
    }
</style>