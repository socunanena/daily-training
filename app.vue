<template>
  <section class="container">
    <CreateExercise @createExercise="addExercise"></CreateExercise>
    <div v-if="exercises !== {}">
      <div class="row">
        <div v-for="exercise in exercises" :key="exercise.name" class="col s12 l6">
          <Exercise :exercise="exercise" @consume="consume(exercise, $event)" @deleteExercise="deleteExercise"></Exercise>
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
    exercises: null,
  }),
  methods: {
    addExercise: function(exercise) {
      this.exercises.push(exercise);

      localStorage.setItem('exercises', JSON.stringify(this.exercises));
    },
    deleteExercise: function(exercise) {
      this.exercises.splice(this.exercises.indexOf(exercise), 1);

      localStorage.setItem('exercises', JSON.stringify(this.exercises));
    },
    consume: function(exercise, toConsume) {
      exercise.consumed += toConsume;

      localStorage.setItem('exercises', JSON.stringify(this.exercises));
    },
  },
  beforeMount: function() {
    try {
      this.exercises = JSON.parse(localStorage.getItem('exercises'));
    } catch (error) {
      this.exercises = [];
    }
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
