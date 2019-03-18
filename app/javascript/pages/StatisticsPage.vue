<template>
    <div id="app" class="container">
        <div class="row">
            <div class="col">
                <vue-good-table
                    mode="remote"
                    :columns="columns"
                    :rows="rows"
                    :totalRows="totalRecords"
                    :pagination-options="{ enabled: true }"
                    @on-page-change="onPageChange"
                    @on-sort-change="onSortChange"
                    @on-per-page-change="onPerPageChange" >
                    <template slot="table-row" slot-scope="props">
                        <span v-if="props.column.field === 'original'">
                            <a v-bind:href="props.row.original">{{ props.row.original }}</a>
                        </span>
                        <span v-else>
                          {{ props.formattedRow[props.column.field] }}
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
                totalRecords: 0,
                serverParams: {
                    field: 'visits',
                    type: 'desc',
                    page: 1,
                    perPage: 10
                },
                rows: [],
            }
        },
        methods: {
            updateParams(newProps) {
                this.serverParams = Object.assign({}, this.serverParams, newProps);
            },
            onPageChange(params) {
                this.updateParams({page: params.currentPage});
                this.loadItems();
            },
            onPerPageChange(params) {
                this.updateParams({perPage: params.currentPerPage});
                this.loadItems();
            },
            onSortChange(params) {
                this.updateParams({
                    type: params.sortType,
                    field: this.columns[params.columnIndex].field,
                });
                this.loadItems();
            },
            loadItems() {
                SERVER_API.get('statistics.json', {params:  this.serverParams }).then(response => {
                    console.log(response);
                    this.totalRecords = response.data.totalRecords;
                    this.rows = response.data.data;
                });
            }
        }
    }
</script>

<style scoped>

</style>