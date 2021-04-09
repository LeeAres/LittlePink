//
//  NoteEditVC-DragDrop.swift
//  LittlePink
//
//  Created by lee on 2021/4/7.
//

import Foundation


extension NoteEditVC: UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let photo = photos[indexPath.item]
        
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: photo))
        dragItem.localObject = photo
        return [dragItem]
    }
    
}


extension NoteEditVC: UICollectionViewDropDelegate{
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath ,
           let destinIndexpath = coordinator.destinationIndexPath{
       
            collectionView.performBatchUpdates {
                photos.remove(at: sourceIndexPath.item)
                photos.insert(item.dragItem.localObject as! UIImage, at: destinIndexpath.item)
                collectionView.moveItem(at: sourceIndexPath, to: destinIndexpath)
            }
            coordinator.drop(item.dragItem, toItemAt: destinIndexpath)
        }
        
    }
}
