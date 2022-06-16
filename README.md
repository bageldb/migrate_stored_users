## Import LocalStore hive to shared preferences

a script to import localstore on flutter app, using bageldb users.
The `MigrateStoredUser` class inlcudes a single methods `import` that retreives the stored values from hive and passes them along to `SharedPreferences` using the newest bagel_db library.
