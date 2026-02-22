<template>
    <h1>KANJI APP</h1>

  <form @submit.prevent="renderData">
    <input v-model="userInput" placeholder="Enter kanji" />
    <button type="submit">Render Data</button>
  </form>

    <br />
    
    <hr>
    <div v-for="(char, index) in charData" :key="char.charindex || index">
        <h2>GENERAL DATA FOR {{ char.character }}</h2>

        <div v-for="(value, key) in char" :key="key">
          <template v-if="key === 'readings' || key === 'series'">
            <!-- skip -->
          </template>
          <template v-else-if="!value">
            {{ key }}: ∅
          </template>
          <template v-else>
            {{ key }}: {{ value }}
          </template>
        </div>
        
        <div v-if="char.readings">
            <h3>READINGS FOR {{ char.character }}</h3>
            <div v-for="(value, key) in JSON.parse(char.readings)" :key="key">
              {{ key }}: {{ value || '∅' }}
            </div>
        </div>

        <div v-if="char.series">
            <h4>SERIES FOR {{ char.character }}</h4>
            <div v-for="(value, key) in JSON.parse(char.series)" :key="key">
              {{ key }}: {{ value || '∅' }}
            </div>
        </div>

        <hr v-if="index < charData.length - 1" />
    </div>
</template>

<script setup>
    import { createApp, ref, onMounted } from "vue";

    const userInput = ref("");
    const charData = ref([]);

    const renderData = async () => {
    if (!userInput.value) return;
    charData.value = null; 

    
    const response = await fetch(`http://localhost:4200/character/${userInput.value}`);
    if (!response.ok) {
      console.error('Server responded with status', response.status);
      charData.value = [];
      return;
    }
    const data = await response.json();
    const orderedData = [...userInput.value]
        .map(ch => data.Hit.find(obj => obj.character === ch))
        .filter(Boolean);
    charData.value = orderedData;
    };
</script>


<style>
    h1 {
        color: green;
    }
    [v-cloak] { display: none; }
</style>
