<template>
  <section class="section">
    <div class="container">
      <section class="section">
        <div class="container">
          <div class="field has-addons">
            <div class="control">
              <input class="input" type="text" placeholder="New person" v-model="newPersonName" v-on:keyup.enter="addSportsperson">
            </div>
          </div>
        </div>
      </section>
      <section class="section" v-for="person in sportsperson" :key="person.name">
        <div class="container">
          <h1 class="title">
            {{ person.name }}
          </h1>
          <table class="table is-fullwidth">
            <thead>
              <tr>
                <th>Exercise</th>
                <th>Target</th>
                <th>Consumed</th>
                <th>Remaining</th>
                <th></th>
              </tr>
            </thead>
            <!-- <tfoot>
              <tr>
                <th>Totals</th>
                <th>{{ training.cristian.map(({ targetReps }) => targetReps).reduce((total, reps) => total + reps, 0) }}</th>
                <th>{{ training.cristian.map(({ currentReps }) => currentReps).reduce((total, reps) => total + reps, 0) }}</th>
                <th>{{  }}</th>
              </tr>
            </tfoot> -->
            <tbody>
              <tr v-for="exercise in person.exercises" :key="exercise.name" class="is-vertical-center">
                <th>{{ exercise.name }}</th>
                <td>{{ exercise.targetReps }}</td>
                <td>{{ exercise.consumedReps }}</td>
                <td>{{ exercise.targetReps - exercise.consumedReps }}</td>
                <td>
                  <div class="field has-addons">
                    <div class="control">
                      <input class="input" type="number" v-model="exercise.repsToAdd">
                    </div>
                    <div class="control">
                      <button class="button is-primary" v-on:click="addReps(exercise)">+</button>
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td><input class="input" type="text" placeholder="Exercise name" v-model="person.newExercise.name"></td>
                <td><input class="input" type="number" placeholder="Target reps" v-model="person.newExercise.reps"></td>
                <td><button class="button is-primary" v-on:click="addExercise(person)">Add exercise</button></td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </section>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    newPersonName: null,
    sportsperson: [],
  }),
  methods: {
    addSportsperson: function() {
      if (!this.newPersonName) {
        return;
      }

      this.sportsperson.push({
        name: this.newPersonName,
        exercises: [],
        newExercise: {},
      });

      this.newPersonName = null;
    },
    addExercise: function(person) {
      if (!person.newExercise.name || !person.newExercise.reps) {
        return;
      }

      person.exercises.push({
        name: person.newExercise.name,
        targetReps: person.newExercise.reps,
        consumedReps: 0,
      });

      person.newExercise = {};
    },
    addReps: function(exercise) {
      if (!exercise.repsToAdd) {
        return;
      }

      exercise.consumedReps += +exercise.repsToAdd;

      exercise.repsToAdd = null;
    },
  },
  mounted: function() {
    if (localStorage.sportsperson) {
      this.sportsperson = JSON.parse(localStorage.sportsperson);
    }
  },
  updated: function() {
    localStorage.sportsperson = JSON.stringify(this.sportsperson);
  },
};
</script>

<style scoped>
  @import './node_modules/bulma/bulma';

  th, td {
    vertical-align: middle;
  }
</style>