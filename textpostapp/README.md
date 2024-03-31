## Execute the app

1. Build the Dockerfile using:

   ```
   docker build -t textpostapp .
   ```

2. Execute the Docker container:

   ```
   docker run -it -p 3000:3000 textpostapp bash
   ```

3. Execute the PSQL:

   ```
   service postgresql start
   ```

4. Setup the application and execute:

   ```
   bin/setup
   rails s -b 0.0.0.0
   ```
