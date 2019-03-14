<template>
    <div v-if="success !== null">
        <div v-if="errors.length === 0">
            <p>Your shortened link is:</p>
            <a v-bind:href="shortened">{{ shortened }}</a>
        </div>
        <div v-else>
            <p>Oops, looks like something went wrong.</p>
            <p v-for="error in errors">{{ error }}</p>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ShortenerInfo",
        props: ['shortened', 'errors', 'success']
    }
</script>

<style scoped>

</style>