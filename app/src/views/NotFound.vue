<template>
    <div class="not-found">
        <b-container>
            <b-row>
                <b-col>
                    <b-alert variant="danger" show>Page Not Found!</b-alert>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
import {BContainer,BRow,BCol,BAlert} from "bootstrap-vue"

export default {
    name: 'NotFound',
    components: {
        BContainer,
        BRow,
        BCol,
        BAlert
    }
}
</script>
