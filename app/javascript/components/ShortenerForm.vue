<template>
  <form method="post" action="/api/v1/links">
    <div class="form-group">
        <shortener-input />
    </div>
    <shortener-submut-button />
  </form>
</template>

<script>
    import ShortenerInput from "./ShortenerInput";
    import ShortenerSubmutButton from "./ShortenerSubmutButton";
    export default {
        name: "ShortenerForm",
        components: {ShortenerSubmutButton, ShortenerInput}
    }
</script>