<template>
  <section class="container">
    <CreateExercise @createExercise="addExercise"></CreateExercise>
    <div v-if="exercises !== {}">
      <div class="row">
        <div v-for="exercise in exercises" :key="exercise.name" class="col s12 l6">
          <Exercise :exercise="exercise" @consume="consume(exercise, $event)"></Exercise>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems);
});

// import kebabCase from 'lodash.kebabcase';

import CreateExercise from './components/createExercise';
import Exercise from './components/exercise';

export default {
  name: 'App',
  components: {
    CreateExercise,
    Exercise,
  },
  data: () => ({
    userName: null,
    exercises: [
      {
        name: 'HSPU',
        measure: 'reps',
        target: 100,
        consumed: 10,
      },
      {
        name: 'Burpees',
        measure: 'reps',
        target: null,
        consumed: 10,
      },
      {
        name: 'Push-ups',
        measure: 'reps',
        target: 50,
        consumed: 10,
      },
    ],
    // exercises: null,
    measures: [
      'reps',
      'seconds',
    ],
  }),
  methods: {
    addExercise: function(exercise) {
      this.exercises.push(exercise);


      // const exercises = JSON.parse(localStorage.exercises);

      // exercises[kebabCase(exercise.name)] = exercise;

      // localStorage.exercises = JSON.stringify(exercises);
    },
    consume: function(exercise, toConsume) {
      exercise.consumed += toConsume;
    },
  },
  beforeMount: function() {
    // if (localStorage.exercises) {
    //   this.exercises = JSON.parse(localStorage.exercises);
    // }
  },
  updated: function() {
    // console.log('updated')
    // localStorage.exercises = JSON.stringify(exercises);
  },
};
</script>

<style lang="scss">
  @import './node_modules/materialize-css/sass/materialize.scss';

  .add-amount {
    max-width: 300px;

    .modal-content {
      padding: 1rem 0 0;
    }
  }
</style>