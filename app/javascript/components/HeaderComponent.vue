<template>
    <div>
        <nav class="navbar navbar-light bg-light mb-2">
            <router-link to="/" class="navbar-brand">URL Shortener</router-link>
            <router-link to="/statistics" class="nav-link">Statistics</router-link>
        </nav>
    </div>
</template>

<script>
    export default {
        name: "HeaderComponent"
    }
</script>

<style scoped>

</style>