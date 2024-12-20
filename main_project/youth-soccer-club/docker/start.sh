docker-entrypoint.sh mysqld &

# wait for mysql to start
while ! mysqladmin ping -h "$DB_HOST" --silent; do
  sleep 1
done

cd standalone
SEED=true HOSTNAME=0.0.0.0 node ./server.js