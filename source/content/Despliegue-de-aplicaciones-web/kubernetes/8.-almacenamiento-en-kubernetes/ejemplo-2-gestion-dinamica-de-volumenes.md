# Ejemplo 2: Gestión dinámica de volúmenes

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_2\_gestin\_dinmica\_de\_volmenes.html)

En este ejemplo vamos a desplegar un servidor web que va a servir una página html que tendrá almacenada en un volumen. En esta ocasión, la asignación del volumen se va a realizar de forma dinámica.

### Aprovisonamiento del volumen

Para que la asignación del volumen (objeto _PersitentVolume_) se haga de forma dinámica al crear la solicitud (objeto _PersitentVolumeClaim_) es necesario tener configurado un aprovisonador de almacenamiento que se define en un objeto `StorageClass`. Como vimos en minikube tenemos configurado un aprovisonador para volúmenes de tipo _hostPath_:

```
kubectl get storageclass
NAME                 PROVISIONER                RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
standard (default)   k8s.io/minikube-hostpath   Delete          Immediate           false                  46d
```

De tal manera que cuando creemos una solicitud de volumen (objeto _PersitentVolumeClaim_) se creara de forma dinámica un objeto _PersitentVolume_, que se asociaría a la solicitud.

### Solicitud del volumen

Vamos a realizar la solicitud de volumen, en este caso usaremos el fichero [`pvc-ejemplo2.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/pvc-ejemplo2.yaml):

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
    name: pvc-ejemplo2
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

## Nota

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_2\_gestin\_dinmica\_de\_volmenes.html)

**Nota**: Fíjate que esta definición hemos quitado la declaración `storageClassName: manual`. Al no ponerla se elegirá el `storageclass` por defecto, cuya definición hemos visto anteriormente en minikube y que en este caso se llama `standard`.

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_2\_gestin\_dinmica\_de\_volmenes.html)

Cuando creemos el objeto PersistentVolumeClaim, veremos que de forma dinámica se creará un _PersitentVolumen_ que se asociará a nuestra solicitud::

```
kubectl apply -f pvc-ejemplo2.yaml

kubectl get pv,pvc
NAME                                                        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
persistentvolume/pvc-6a09c69a-4344-447c-b23d-d85c7edd7f36   1Gi        RWX            Delete           Bound    default/pvc-ejemplo2   standard                1s

NAME                                 STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/pvc-ejemplo2   Bound    pvc-6a09c69a-4344-447c-b23d-d85c7edd7f36   1Gi        RWX            standard       1s
```

```
```

## Nota

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_2\_gestin\_dinmica\_de\_volmenes.html)

**Nota**: En este caso, como el volumen se ha generado dinámicamente, su capacidad es igual a la solicitada, 1 Gb.

[Ocultar](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/ejemplo\_2\_gestin\_dinmica\_de\_volmenes.html)

Como el volumen ha sido generado de forma dinámica por el aprovisonador, éste habrá escogido una carpeta del host que corresponda al volumen.

```
kubectl describe persistentvolume/pvc-6a09c69a-4344-447c-b23d-d85c7edd7f36
...
Source:
    Type:          HostPath (bare host directory volume)
    Path:          /tmp/hostpath-provisioner/default/pvc-ejemplo2
...
```

### Uso del volumen

A partir de este punto el ejercicio es muy parecido al que vimos en el ejemplo1.

Creamos el Deployment usando el fichero [`deploy-ejemplo2.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/deploy-ejemplo2.yaml):

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-ejemplo2
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
        - name: volumen-ejemplo2
          persistentVolumeClaim:
            claimName: pvc-ejemplo2
      containers:
        - name: contenedor-nginx
          image: nginx
          ports:
            - name: http-server
              containerPort: 80
          volumeMounts:
            - mountPath: "/usr/share/nginx/html"
              name: volumen-ejemplo2
```

Creamos el Deployment:

```
kubectl apply -f deploy-ejemplo2.yaml
```

Y a continuación, cuando el contenedor esté funcionando, creamos el fichero `index.html`:

```
kubectl get all
...
NAME                                 READY   STATUS    RESTARTS   AGE
pod/nginx-ejemplo2-7b79b5966-zbdqh   1/1     Running   0          5s
...
kubectl exec pod/nginx-ejemplo2-7b79b5966-zbdqh -- bash -c "echo '<h1>Almacenamiento en K8S</h1>' > /usr/share/nginx/html/index.html"
```

Finalmente creamos el Service de acceso al despliegue, usando el fichero [`srv-ejemplo2.yaml`](https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod\_imscp/content/2/srv-ejemplo2.yaml).

```
kubectl apply -f srv-ejemplo2.yaml

kubectl get all
...
service/nginx-ejemplo2   NodePort    10.99.48.24   <none>        80:31053/TCP   3s
...
```

Y accedemos a la aplicación accediendo a la ip del nodo controlador del cluster y al puerto asignado al Service NodePort:

```
minikube ip
192.168.39.222
```

<figure><img src="https://educacionadistancia.juntadeandalucia.es/profesorado/pluginfile.php/2171725/mod_imscp/content/2/volumen2.png" alt="" height="112" width="479"><figcaption><p>Imagen de elaboración propia (<a href="http://creativecommons.org/licenses/?lang=es">CC BY-NC-SA</a>)</p></figcaption></figure>

Finalmente puedes volver a comprobar que la información de la aplicación no se pierde borrando el Deployment y volviéndolo a crear, comprobando que se sigue sirviendo el fichero `index.html`.

### Eliminación del volumen

En este caso, los volúmenes que crea de forma dinámica el `storageclass` que tenemos creado en minikube, tienen como política de reciclaje el valor de `Delete`. Esto significa que cuando eliminemos la solicitud, el objeto PersistentVolumeClaim, también se borrará el volumen, el objeto PersistentVolume.

```
kubectl delete persistentvolumeclaim/pvc-ejemplo2

kubectl get pv,pvc
No resources found
```
