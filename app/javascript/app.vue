<template>
  <div id="app" class="container-fluid">
    <div class="row full-height-container">
      <div class="col-12">
        <div class="text-center">
          <span>{{ message }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.full-height-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
}
</style>
