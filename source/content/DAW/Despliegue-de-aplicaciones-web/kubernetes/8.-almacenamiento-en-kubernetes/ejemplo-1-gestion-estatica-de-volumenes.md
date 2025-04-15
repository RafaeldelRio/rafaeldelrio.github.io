# Ejemplo 1: Gestión estática de volúmenes

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_1\_gestin\_esttica\_de\_volmenes.html)

En este ejemplo vamos a desplegar un servidor web que va a servir una página html que tendrá almacenada en un volumen. En este primer ejemplo, la asignación del volumen se va a realizar de forma estática.

### Aprovisonamiento del volumen

En este caso, será el administrador del cluster el responsable de dar de alta en el cluster los volúmenes disponibles. Como hemos estudiado anteriormente, indicaremos algunas características del volumen: la capacidad, el modo de acceso, la política de reciclaje, el tipo de volumen,...

Para ello vamos a describir el objeto PersistentVolume en el fichero [`pv-ejemplo1.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/pv-ejemplo1.yaml):

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-ejemplo1
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  hostPath:
    path: /data/pv-ejemplo1
```

## Nota

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_1\_gestin\_esttica\_de\_volmenes.html)

**Nota**: como estamos utilizando minikube, y nuestro cluster está formado por un sólo nodo, el tipo de almacenamiento más simple que podemos usar es `hostPath`, que creará un directorio en el nodo (`/data/pv-ejemplo1`) que será el que se monte en el Pod para guardar la información.

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_1\_gestin\_esttica\_de\_volmenes.html)

El administrador crea el volumen:

```
kubectl apply -f pv-ejemplo1.yaml
```

Podemos ver los volúmenes que tenemos disponibles en el cluster:

```
kubectl get pv
NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
persistentvolume/pv-ejemplo1   5Gi        RWX            Recycle          Available           manual                  73s
```

Nos fijamos que el estado del volumen es `Available`, todavía no se ha asociado con ninguna solicitud de volumen.

Y podemos obtener los detalle de este recurso:

```
kubectl describe pv pv-ejemplo1
```

### Solicitud del volumen

A continuación, nosotros como desarrolladores necesitamos solicitar un volumen con ciertas características para nuestra aplicación, para ello vamos a definir un objeto PersistentVolumeClaim, que definiremos en el fichero [`pvc-ejemplo1.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/pvc-ejemplo1.yaml):

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
    name: pvc-ejemplo1
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

Como vemos, desde el punto de vista del desarrollador no se necesita saber los tipos de volúmenes que tenemos disponibles, simplemente indicamos que queremos un 1Gb de almacenamiento, el tipo de acceso y que se haga la asignación de forma estática (`storageClassName: manual`).

Cuando creemos el objeto PersistentVolumeClaim podremos comprobar si hay algún volumen (PersistentVolume) disponible en el cluster que cumpla con los requisitos:

```
kubectl apply -f pvc-ejemplo1.yaml

kubectl get pv,pvc
NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
persistentvolume/pv-ejemplo1   5Gi        RWX            Recycle          Bound    default/pvc-ejemplo1   manual                  2m1s

NAME                                 STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/pvc-ejemplo1   Bound    pv-ejemplo1   5Gi        RWX            manual         3s
```

Podemos apreciar que el el estado del volumen ha cambiado a `Bound` que significa que ya está asociado al PersistentVolumeClaim que hemos creado.

## Nota

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_1\_gestin\_esttica\_de\_volmenes.html)

**Nota**: El desarrollador quería 1 Gb de disco, demanda que se cumple de sobra con los 5 Gb del volumen que se ha asociado.

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_1\_gestin\_esttica\_de\_volmenes.html)

### Uso del volumen

Una vez que tenemos un volumen a nuestra disposición, vamos a crear un despliegue de un servidor web, indicando en la especificación del Pod, que estará formado por el volumen y el directorio donde vamos a montarlo. Para ello vamos a usar el fichero [`deploy-ejemplo1.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/deploy-ejemplo1.yaml):

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-ejemplo1
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      volumes:
        - name: volumen-ejemplo1
          persistentVolumeClaim:
            claimName: pvc-ejemplo1
      containers:
        - name: contenedor-nginx
          image: nginx
          ports:
            - name: http-server
              containerPort: 80
          volumeMounts:
            - mountPath: "/usr/share/nginx/html"
              name: volumen-ejemplo1
```

Podemos observar que en la especificación del Pod hemos indicado que estará formado por un volumen correspondiente al asignado al PersistentVolumeClaim `pvc-ejemplo1` y que el contenedor tendrá en el volumen un punto de montaje en el directorio _DocumentRoot_ de nginx (`/usr/share/nginx/html`) .

Creamos el Deployment:

```
kubectl apply -f deploy-ejemplo1.yaml
```

Y a continuación, cuando el contenedor esté funcionando:

```
kubectl get all
...
NAME                                  READY   STATUS    RESTARTS   AGE
pod/nginx-ejemplo1-86864d84b5-s62dq   1/1     Running   0          6s
...
```

Vamos a ejecutar un comando en el Pod para que se cree un fichero `index.html` en el directorio `/usr/share/nginx/html` (evidentemente estaremos guardando ese fichero en el volumen).

```
kubectl exec pod/nginx-ejemplo1-86864d84b5-s62dq -- bash -c "echo '<h1>Almacenamiento en K8S</h1>' > /usr/share/nginx/html/index.html"
```

Finalmente creamos el Service de acceso al despliegue, usando el fichero [`srv-ejemplo1.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/srv-ejemplo1.yaml).

```
kubectl apply -f srv-ejemplo1.yaml

kubectl get all
...
service/nginx-ejemplo1   NodePort    10.106.238.146   <none>        80:32581/TCP   13s
...
```

Y accedemos a la aplicación, accediendo a la ip del nodo controlador del cluster y al puerto asignado al Service NodePort:

```
minikube ip
192.168.39.222
```

<figure><img src="https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod_imscp/content/2/volumen.png" alt="" height="122" width="471"><figcaption><p>Imagen de elaboración propia (<a href="http://creativecommons.org/licenses/?lang=es">CC BY-NC-SA</a>)</p></figcaption></figure>

###

### Comprobemos la persistencia de la información

En primer lugar podemos acceder al nodo del cluster y comprobar que en el directorio que indicamos en la creación del volumen, efectivamente existe el fichero `index.html`:

```
minikube ssh
ls /data/pv-ejemplo1
index.html
```

En segundo lugar podemos hacer la prueba de eliminar el despliegue, volver a crearlo y volver a acceder a la aplicación para comprobar que el servidor web sigue sirviendo el mismo fichero `index.html`:

```
kubectl delete -f deploy-ejemplo1.yaml
kubectl apply -f deploy-ejemplo1.yaml
```

Y volvemos acceder al mismo puerto:

<figure><img src="https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod_imscp/content/2/volumen.png" alt="" height="122" width="471"><figcaption><p>Imagen de elaboración propia (<a href="http://creativecommons.org/licenses/?lang=es">CC BY-NC-SA</a>)</p></figcaption></figure>

###

### Eliminación del volumen

Si finalmente queremos eliminar los volúmenes creados, tendremos que eliminar la solicitud, el objeto PersistentVolumeClaim, y dependiendo de la política de reciclaje con la que creamos el objeto PersistentVolume tendremos distintos comportamientos.

En este caso, como la política de reciclaje con la que creamos el volumen es `Recycle`, no se eliminará pero se borrará su contenido y el volumen se podrá reutilizar, es decir su estado volverá a `Available`:

```
kubectl delete persistentvolumeclaim/pvc-ejemplo1

kubectl get pv,pvc
NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
persistentvolume/pv-ejemplo1   5Gi        RWX            Recycle          Available           manual                  8m8s
```

Si queremos eliminar el objeto PersistentVolume, ejecutamos:

```
kubectl delete persistentvolume/pv-ejemplo1
```
