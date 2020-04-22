<template>
  <div class="card blue-grey darken-1">
    <div class="card-content white-text">
      <span class="card-title">{{ name }}</span>
      <p v-if="exercise.targetReps">{{ targetReps }} {{ measure }}</p>
      <p v-else>-</p>
    </div>
    <div class="card-action">
      <span class="chip green z-depth-1">{{ consumedReps }} consumed</span>
      <span v-if="targetReps" class="chip pink z-depth-1">{{ targetReps - consumedReps }} remining</span>
      <a :href="`#add-amount-${name}`" :data-add-amount="`add-amount-${name}`" class="btn btn-small btn-floating right waves-effect waves-light modal-trigger">
        <i class="material-icons">add</i>
      </a>
      <div :id="`add-amount-${name}`" class="modal add-amount">
        <div class="modal-content valign-wrapper container">
          <div class="input-field inline">
            <input :id="`input-${name}`" type="number" v-model.number="repsToConsume">
            <label :for="`input-${name}`">{{ name }}</label>
          </div>
          <div class="input-field inline">
            <button class="btn btn-floating btn-small modal-close" v-on:click="consumeReps"><i class="material-icons">send</i></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import kebabCase from 'lodash.kebabcase';

export default {
  name: 'Exercise',
  props: ['id', 'exercise'],
  data: () => ({
    name: null,
    measure: null,
    targetReps: null,
    consumedReps: 0,
    repsToConsume: null,
  }),
  watch: {
    consumedReps: function(consumedReps) {
      const exercises = JSON.parse(localStorage.exercises);
      exercises[this.id].consumedReps = consumedReps;
      localStorage.exercises = JSON.stringify(exercises);
    },
  },
  methods: {
    consumeReps: function() {
      this.consumedReps += this.repsToConsume;

      this.repsToConsume = 0;
    },
  },
  beforeMount: function() {
    this.name = this.exercise.name;
    this.measure = this.exercise.measure;
    this.targetReps = this.exercise.targetReps;
    this.consumedReps = this.exercise.consumedReps;
  },
};
</script>