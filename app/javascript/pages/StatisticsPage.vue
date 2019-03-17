<template>
    <div id="app" class="container">
        <div class="row">
            <div class="col">
                <vue-good-table
                    :columns="columns"
                    :rows="rows"
                    :sort-options="{ enabled: true, initialSortBy: { field: 'visits', type: 'desc' }}">
                    <template slot="table-row" slot-scope="props">
                        <span v-if="props.column.field === 'original'">
                            <a v-bind:href="props.row.original">{{props.row.original}}</a>
                        </span>
                        <span v-else>
                          {{props.formattedRow[props.column.field]}}
                        </span>
                    </template>
                </vue-good-table>
            </div>
        </div>
    </div>
</template>

<script>
    import { SERVER_API } from '../packs/application';
    import { VueGoodTable } from 'vue-good-table';
    import 'vue-good-table/dist/vue-good-table.css'

    export default {
        name: "StatisticsPage",
        components: { VueGoodTable },
        data: function() {
            return {
                columns: [
                    { label: 'Link address', field: 'original', sortable: true, type: 'text' },
                    { label: 'Visits amount', field: 'visits', sortable: true, type: 'number' },
                ],
                rows: [],
            }
        },
        methods: {
            fetchVisitsStatistics: function() {
                let self = this;
                SERVER_API.get('statistics.json', {})
                    .then(function(response){
                        console.log(response);
                        self.rows = response.data;
                    })
                    .catch(function(error){
                        console.log(error)
                    });
            }
        },
        mounted() {
            this.fetchVisitsStatistics();
        }
    }
</script>

<style scoped>

</style>