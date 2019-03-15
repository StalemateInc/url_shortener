<template>
  <form method="post" action="/api/v1/links.json" v-on:submit.prevent="submitForm">
    <shortener-info v-bind:errors="errors" v-bind:shortened="shortened" v-bind:success="success" />
    <div class="form-group">
        <shortener-input ref="shortener_input" />
    </div>
    <shortener-submut-button />
  </form>
</template>

<script>
    import { SERVER_API } from '../packs/application';
    import Vue from 'vue';
    import ShortenerInput from "./ShortenerInput";
    import ShortenerSubmutButton from "./ShortenerSubmutButton";
    import ShortenerInfo from './ShortenerInfo'

    function initialState() {
      return {
        shortened: "",
        errors: [],
        success: null
      }
    }

    export default {
        name: "ShortenerForm",
        data: function() {
          return initialState()
        },
        components: {ShortenerInfo, ShortenerSubmutButton, ShortenerInput},
        methods: {
          submitForm: function(event) {
            event.preventDefault();
            let self = this;
            SERVER_API.post('links.json', {
              original: this.$refs.shortener_input["original"]
            }).then(function(response) {
              console.log(response);
              const response_data = response.data;
              const success = response_data.success;
              initialState();
              if (success) {
                Vue.set(self, 'shortened', response_data.link.shortened);
              }
              Vue.set(self, 'success', response_data.success);
              Vue.set(self, 'errors', response_data.errors);
            }).catch(function(error) {
              console.log(error);
            });
          },
        }
    }


</script>