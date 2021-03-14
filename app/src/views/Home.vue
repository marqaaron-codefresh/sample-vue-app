<template>
    <div class="home">
        <b-container :fluid="true" class="callout">
            <div class="grid-container">
                <div class="logo-container">
                    <img class="logo" :src="logo" alt="">
                </div>
                <div class="title-container">
                    <div class="title">Technical Assessment</div>
                </div>
            </div>
        </b-container>
        <b-container :fluid="true">
            <b-row>
                <b-col class="version-badge mt-4">
                    <b-badge variant="warning" size="sm">Build Version: {{version}}</b-badge>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
import {BContainer,BRow,BCol,BBadge} from "bootstrap-vue"
import codeFreshLogo from "@/assets/codefresh-logo.svg";
import {envVars} from "@/main";

export default {
    name: 'Home',
    computed: {
        logo(){
          return codeFreshLogo;
        },
        version(){
            return envVars.VERSION;
        }
    },
    components: {
        BContainer,
        BRow,
        BCol,
        BBadge
    }
}
</script>

<style scoped>
.callout {
    height:300px;
    width:100%;
    background-color:#03363d;
    padding:0;
}
.grid-container {
    display: grid;
    height: 100%;
    grid-template-areas:
        "left logo right"
        "title title title"
        "footer footer footer";
    grid-template-rows: .7fr .3fr 50px;
    grid-template-columns: .5fr 300px .5fr;
}
.logo-container {
    grid-area:logo;
    margin:auto 0;
}
.logo {
    width:100%;
}
.title-container {
    grid-area:title;
    display:grid;
    color:white;
    font-weight:bold;
    font-size:18px;
    background-color:#19a99b;
}
.title {
    margin:auto 0;
}

.version-badge {
    text-align:right;
}
</style>
