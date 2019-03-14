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
              console.log(self.errors);
              initialState();
              if (response_data.success) {
                // self.shortened = response_data.shortened;
                Vue.set(self, 'shortened', response_data.shortened);
                Vue.set(self, 'success', true);
              } else {
                // self.errors = response_data.errors;
                Vue.set(self, 'errors', response_data.errors);
                Vue.set(self, 'success', false);
              }
            }).catch(function(error) {
              console.log(error);
            });
          },
        }
    }


</script>