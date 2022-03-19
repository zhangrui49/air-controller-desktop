
import 'package:mobile_assistant_client/model/ImageItem.dart';
import 'package:mobile_assistant_client/repository/aircontroller_client.dart';

import '../model/AlbumItem.dart';

class ImageRepository {
  final AirControllerClient client;

  ImageRepository({required AirControllerClient client}): this.client = client;

  Future<List<ImageItem>> getAllImages() => this.client.getAllImages();

  Future<List<ImageItem>> getCameraImages() => this.client.getCameraImages();

  Future<List<ImageItem>> deleteImages(List<ImageItem> images) => this.client.deleteImages(images);

  void copyImagesTo({
    required List<ImageItem> images,
    required String dir,
    Function(String fileName)? onDone,
    Function(String fileName, int current, int total)? onProgress,
    Function(String error)? onError
  }) => this.client.copyFileTo(
      paths: images.map((image) => image.path).toList(),
      dir: dir,
    onDone: onDone,
    onError: onError,
    onProgress: onProgress
  );

  void cancelCopy() => this.client.cancelDownload();

  Future<List<AlbumItem>> getAllAlbums() => this.client.getAllAlbums();

  Future<List<ImageItem>> getImagesInAlbum(AlbumItem albumItem) => this.client.getImagesInAlbum(albumItem);
}