<template>
    <div class="profile">
        <b-container>
            <b-row>
                <b-col>
                    <b-alert variant="success" show>This is your protected profile.</b-alert>
                    <logout-button></logout-button>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
import LogoutButton from "@/components/LogoutButton";
import {BContainer,BRow,BCol,BAlert} from "bootstrap-vue"

export default {
    name: 'Profile',
    components: {
        LogoutButton,
        BContainer,
        BRow,
        BCol,
        BAlert
    }
}
</script>
