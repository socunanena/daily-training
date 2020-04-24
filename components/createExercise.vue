<template>
  <form class="row">
    <div class="input-field col s7">
      <input id="name" type="text" v-model="name">
      <label for="name">Exercise name</label>
    </div>
    <div class="input-field col s2">
      <input id="target" type="number" v-model.number="target">
      <label for="target">Target</label>
    </div>
    <div class="input-field col s3">
      <select v-model="measure">
        <option value="reps" selected>Reps</option>
        <option value="seconds">Seconds</option>
      </select>
      <label>Measure</label>
    </div>
    <div class="col s12 center-align">
      <a class="waves-effect waves-light btn" v-on:click="createExercise">Create exercise</a>
    </div>
  </form>
</template>

<script>
document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('select');
  var instances = M.FormSelect.init(elems);
});

export default {
  name: 'CreateExercise',
  data: () => ({
    name: null,
    target: null,
    measure: null,
  }),
  methods: {
    createExercise: function() {
      const exercise = {
        name: this.name,
        target: this.target,
        measure: this.measure,
        consumed: 0,
      };

      this.$emit('createExercise', exercise);
    },
  },
};
</script>
