<template>
  <section class="container">
    <div v-if="exercises !== {}">
      <div class="row">
        <div v-for="(exercise, id) in exercises" :key="id" class="col s12 l6">
          <Exercise :id="id" :exercise="exercise"></Exercise>
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

import Exercise from './components/exercise';

export default {
  name: 'App',
  components: {
    Exercise,
  },
  data: () => ({
    userName: null,
    // exercises: [
    //   {
    //     name: 'HSPU',
    //     measure: 'reps',
    //     target: 100,
    //     consumed: 10,
    //   },
    //   {
    //     name: 'Burpees',
    //     measure: 'reps',
    //     target: null,
    //     consumed: 10,
    //   },
    //   {
    //     name: 'Push-ups',
    //     measure: 'reps',
    //     target: 50,
    //     consumed: 10,
    //   },
    // ],
    exercises: null,
    measures: [
      'reps',
      'seconds',
    ],
  }),
  methods: {
  },
  beforeMount: function() {
    console.log('app mounted')
    if (localStorage.exercises) {
      this.exercises = JSON.parse(localStorage.exercises);
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